def math
  math_string = get_message
  calculator = Dentaku::Calculator.new
  begin
    calculator.evaluate(math_string)
  rescue
    chan_send("There is a syntax error in your expression!")
  else
    math_threads = []
    if Thread.list.count <= 1
      c_thread = Thread.new do
        math_threads << c_thread
        chan_send(calculator.evaluate(math_string))
      end
    else
      chan_send("Currently processing an equation!")
    end
  end
end