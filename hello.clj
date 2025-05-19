(ns hello)

(defn greet
  "Greets the user by name, if parameter supplied.
If none supplied, assumes name is `World`"

  ([] (greet "World"))
  ([name] (str "Hello, " name "!")))

(println (greet))
(println (greet "from Clojure"))

