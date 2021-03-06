#shellcheck shell=sh

Describe "core/subjects/word.sh"
  BeforeRun set_stdout subject_mock

  Describe "word subject"
    Example 'example'
      foobarbaz() { echo "foo bar"; echo "baz"; }
      When call foobarbaz
      The word 3 should equal "baz"
    End

    It "gets specified word of stdout when stdout is defined"
      stdout() { echo "word1 word2"; echo "word3"; }
      When run shellspec_subject_word 3 _modifier_
      The stdout should equal 'word3'
    End

    It "gets undefined when stdout is undefined"
      stdout() { false; }
      When run shellspec_subject_word 1 _modifier_
      The status should be failure
    End
  End
End
