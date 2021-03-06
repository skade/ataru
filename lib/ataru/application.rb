module Ataru
  class Application
    def self.run_test_for_file(file_name)

      #creating kramdown doc out of md file
      kramdown_doc = MarkdownLoader.load_file(file_name)
      #pulling an array of codespans/code samples from markdown document
      code_samples = Traverser.new(kramdown_doc, file_name).code_samples
      #wrapping code samples in minitest tests
      TestClassBuilder.new(code_samples).build_test_class
      require 'minitest/autorun'
    end
  end
end
