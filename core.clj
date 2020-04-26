(ns vcp.core
  (:gen-class))

(defn -main
  "VCP Program"
  [& args]
  (def message "THECLOJUREPROGRAMMER")
  (def keyText "NEERAJ")

  (def msg (clojure.string/split message #""))
  (def key (clojure.string/split keyText #""))
  (def msgLen (dec (count msg)))

  (def newKey [])
  (def encryptedMsg [])
  (def decryptedMsg [])

  (def j 0)
  (loop [i 0]
    (if (= j (count key))
      (def j 0))
    (def newKey (conj newKey (get key j)))
    (if (< i msgLen) ;changed > to <=
      (do
        (def j (inc j))
        (recur (inc i)))))

  (loop [i 0]
    (def encryptedMsg (conj encryptedMsg
      (char (+ (mod (+ (int (.charAt (get msg i) 0)) (int (.charAt (get newKey i) 0))) 26) (int \A)))))
    (if (< i msgLen)
      (recur (inc i))))

  (loop [i 0]
    ; do not use .charAt for encryptedMsg because the values in the vector
    ; already have the '\' because of how it was generated in the previous loop
    (def decryptedMsg (conj decryptedMsg
      (char (+ (mod (+ (- (int (get encryptedMsg i)) (int (.charAt (get newKey i) 0))) 26) 26) (int \A)))))
    (if (< i msgLen)
      (recur (inc i))))

  (println "Origninal Message:" (clojure.string/join "" msg))
  (println "Key:" (clojure.string/join "" key))
  (println "Generated Key:" (clojure.string/join "" newKey))
  (println "EncryptedMsg:" (clojure.string/join "" encryptedMsg))
  (println "DecryptedMsg:" (clojure.string/join "" decryptedMsg))
);main
