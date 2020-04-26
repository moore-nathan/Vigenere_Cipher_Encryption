message = "THEJAVAPROGRAMMER"
keyText = "NEERAJ"

--msg = message.split("")
--key = keyText.split("")
--msgLen = msg.length

msg = {}
for i = 1,#message do
	msg[i] =  message:sub(i,i)
end

key = {}
for i=1,#keyText do
	key[i] = keyText:sub(i,i)
end

msgLen = #message

newKey = {}
encryptedMsg = {}
decryptedMsg = {}


j = 1
for i = 1, msgLen do
	if j == #keyText+1 then
		j = 1
	end
	newKey[i] = key[j];
	j = j + 1
end


for i = 1,msgLen do
	encryptedMsg[i] = string.char(((string.byte(msg[i]) + string.byte(newKey[i])) % 26) + string.byte("A"))
	--encryptedMsg[i] = string.char(((msg[i].charCodeAt(0) + newKey[i].charCodeAt(0)) % 26) + 'A'.charCodeAt(0))
end
for i = 1,msgLen do
	decryptedMsg[i] = string.char((((string.byte(encryptedMsg[i]) - string.byte(newKey[i])) + 26) % 26) + string.byte("A"))
	--decryptedMsg[i] = string.char(((((encryptedMsg[i].charCodeAt(0) - newKey[i].charCodeAt(0)) + 26) % 26) + 'A'.charCodeAt(0)))
end

function tablePrint(l)
	str = ""
	for i,v in pairs(l) do
		--io.write(v)
		str = str..v
	end
	return str
end


print("Original Message: "..tablePrint(msg))
print("Key: "..tablePrint(key))
print("Generated Key: "..tablePrint(newKey))
print("Encrypted Message: "..tablePrint(encryptedMsg))
print("Decrytped Message: "..tablePrint(decryptedMsg))