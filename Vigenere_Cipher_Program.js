var message = "THEJAVAPROGRAMMER";
var keyText = "NEERAJ";

var msg = message.split("");
var key = keyText.split("");
var msgLen = msg.length;

var newKey = new Array(msgLen);
var encryptedMsg = new Array(msgLen);
var decryptedMsg = new Array(msgLen);

//generate new key in cyclic manner equal to the length of original message
for(let i = 0, j = 0; i < msgLen; ++i, ++j){
	if(j === key.length)
		j = 0;
	
	newKey[i] = key[j];
}

//encryption
for(let i = 0; i < msgLen; ++i)
	console.log(msg[i].charCodeAt(0));
	encryptedMsg[i] = String.fromCharCode(((msg[i].charCodeAt(0) + newKey[i].charCodeAt(0)) % 26) + 'A'.charCodeAt(0));

//decryption
for(let i = 0; i < msgLen; ++i)
	decryptedMsg[i] = String.fromCharCode(((((encryptedMsg[i].charCodeAt(0) - newKey[i].charCodeAt(0)) + 26) % 26) + 'A'.charCodeAt(0)));

console.log("Original Message: " + msg.join(""));
console.log("Key: " + key.join(""));
console.log("Generated Key: " + newKey.join(""));
console.log("\nEncrypted Message: " + encryptedMsg.join(""));
console.log("\nDecrypted Message: " + decryptedMsg.join(""));

