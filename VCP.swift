import Foundation
func Int_to_Char(i: UInt32) -> Character{
	let u = UnicodeScalar(i)
	let c = Character(u!)
	return c
}

let message = "THESWIFTPROGRAMMER"
let keyText = "NEERAJ"

let msg = Array(message)
let key = Array(keyText)
let msgLen = msg.count

var newKey = [String]()
var encryptedMsg = [String]()
var decryptedMsg = [String]()

var j = 0
for _ in 0...msgLen-1{
	if j == key.count{
		j = 0
	}
	
	newKey.append(String(key[j]))
	j = j+1
}

for i in 0...msgLen-1{
	encryptedMsg.append(String(Int_to_Char(i: (((UnicodeScalar(String(msg[i]))!.value + UnicodeScalar(String(newKey[i]))!.value) % 26) + UnicodeScalar("A")!.value))))
}

for i in 0...msgLen-1{
	decryptedMsg.append(String(Int_to_Char(i: UInt32((((Int(UnicodeScalar(encryptedMsg[i])!.value) - Int(UnicodeScalar(newKey[i])!.value)) + Int(26)) % 26) + Int(UnicodeScalar("A")!.value)))))
	
}
// Result has 3 strings.
print("Original Message: \(message)")
print("Key: \(keyText)")
print("Generated Key: " + newKey.joined(separator: ""))
print("Encrypted Message: " + encryptedMsg.joined(separator: ""))
print("Decrypted Message: " + decryptedMsg.joined(separator: ""))