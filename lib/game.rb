class Game
  TOTAL_ERRORS_ALLOWED = 7

  def initialize(word)
    @letters = word.upcase.chars
    @user_guesses = []
  end

  def errors
    @user_guesses - normilized_letters
  end

  def errors_made
    errors.length
  end

  def errors_allowed
    TOTAL_ERRORS_ALLOWED - errors_made
  end

  def letters_to_guess
    result =
      @letters.map do |letter|
        if @user_guesses.include?(normilize_letter(letter))
          letter
        end
      end
  end

  def lost?
    errors_allowed == 0
  end

  def normilize_letter(letter)
    return "Е" if letter == "Ё"
    return "И" if letter == "Й"
    letter
  end

  def normilized_letters
    @letters.map { |letter| normilize_letter(letter) }
  end

  def over?
    won? || lost?
  end

  def play!(letter)
    normilized_letter = normilize_letter(letter)

    if !over? && !@user_guesses.include?(normilized_letter)
      @user_guesses << normilized_letter
    end
  end

  def word
    @letters.join
  end

  def won?
    (normilized_letters - @user_guesses).empty?
  end
end
