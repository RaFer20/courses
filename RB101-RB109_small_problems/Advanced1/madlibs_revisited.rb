MADLIBS = {
  noun: ["fox", "dog", "head", "leg", "cat"],
  verb: ["jumps", "lifts", "bites", "licks", "runs", "swims"],
  adjective: ["quick", "lazy", "sleepy", "ugly", "pretty", "tired", "happy"],
  adverb: ["easily", "lazily", "noisily", "excitedly", "joyfully"]
}

file = File.read("madlibs_revisited.txt")

madlibs = file.split.map do |word|
    new_word = if word.start_with?("%{adjective}")
        MADLIBS[:adjective].sample
      elsif word.start_with?("%{noun}")
        MADLIBS[:noun].sample
      elsif word.start_with?("%{verb}")
        MADLIBS[:verb].sample
      elsif word.start_with?("%{adverb}")
        MADLIBS[:adverb]
      else
        word
      end
    new_word += "," if word.end_with?(",")
    new_word += "." if word.end_with?(".")
    new_word
  end.join(" ")

p madlibs
