message = "THEJAVAPROGRAMMER"
keyText = "NEERAJ"

msg = message.split ""
key = keyText.split ""
msgLen = msg.length

newKey = new Array msgLen
encryptedMsg = new Array msgLen
decryptedMsg = new Array msgLen


j = 0
for i in [0...msgLen]
	
	if j == key.length
		j = 0
		
	newKey[i] = key[j];
	j++


for i in [0...msgLen]
	# console.log((msg[i].charCodeAt(0) + newKey[i].charCodeAt(0)) % 26)
	encryptedMsg[i] = String.fromCharCode(((msg[i].charCodeAt(0) + newKey[i].charCodeAt(0)) % 26) + 'A'.charCodeAt(0))
	
for i in [0...msgLen]
	decryptedMsg[i] = String.fromCharCode(((((encryptedMsg[i].charCodeAt(0) - newKey[i].charCodeAt(0)) + 26) % 26) + 'A'.charCodeAt(0)))
	
console.log("Original Message: " + msg.join(""))
console.log("Key: " + key.join(""))
console.log("Generated Key: " + newKey.join(""))
console.log("\nEncrypted Message: " + encryptedMsg.join(""))
console.log("\nDecrypted Message: " + decryptedMsg.join(""))