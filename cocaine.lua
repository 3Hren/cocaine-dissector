function table.val_to_str(v)
    if "string" == type(v) then
        v = string.gsub(v, "\n", "\\n")
        if string.match(string.gsub(v,"[^'\"]",""), '^"+$') then
            return "'" .. v .. "'"
        end
        return '"' .. string.gsub(v,'"', '\\"') .. '"'
    else
        return "table" == type(v) and table.tostring(v) or tostring(v)
    end
end

function table.key_to_str(k)
    if "string" == type(k) and string.match(k, "^[_%a][_%a%d]*$") then
        return k
    else
        return "[" .. table.val_to_str(k) .. "]"
    end
end

function table.tostring(tbl)
    local result, done = {}, {}
    for k, v in ipairs(tbl) do
        table.insert(result, table.val_to_str(v))
        done[k] = true
    end
    for k, v in pairs(tbl) do
        if not done[k] then
            table.insert(result, table.key_to_str(k) .. "=" .. table.val_to_str(v))
        end
    end
    return "{" .. table.concat(result, ",") .. "}"
end

--------------------------------------------------------------------------------

local msgpack = require "lua-MessagePack/src/MessagePack"

cocaine_proto = Proto("cocaine", "Cocaine RPC Protocol")

local f = cocaine_proto.fields
f.id_field = ProtoField.uint32("cocaine.id", "Id")
f.ty_field = ProtoField.uint32("cocaine.ty", "Type")
f.frame_field = ProtoField.string("cocaine.frame", "Frame")

function cocaine_proto.dissector(buf, pinfo, tree)
    pinfo.cols.protocol = "COCAINE"

    local b = buf():bytes()

    str = ""
    for i = 0, b:len() - 1 do
        str = str .. string.char(b:get_index(i))
    end

    len = str:sub(1, 1)
    -- Array of length 3 or 4.
    if len ~= string.char(0x93) and len ~= string.char(0x94) then
        return
    end

    local flag, ret = pcall(msgpack.unpack, str)
    if not flag then
        if ret:find("missing bytes$") then
            pinfo.desegment_len = DESEGMENT_ONE_MORE_SEGMENT
            return
        else
            error(ret)
        end
    end

    up = msgpack.unpacker(str:sub(2, str:len()))

    local offset = 0
    local subtree = tree:add(cocaine_proto, buf(), "Cocaine RPC Protocol")

    -- Channel id.
    nread, value = up()
    subtree:add(f.id_field, buf(offset, offset + nread), value)
    offset = offset + nread

    -- Message type.
    nread, value = up()
    subtree:add(f.ty_field, buf(offset, offset + nread), value)
    offset = offset + nread

    -- Frame.
    subtree:add(f.frame_field, buf(), table.tostring(ret))
    return true
end

function cocaine_proto.init()
end

local tcp_table = DissectorTable.get("tcp.port")
for port = 10000, 65535 do
    tcp_table:add(port, cocaine_proto)
end
