module Matrixlpp
  class MatrixDSL
    #Inicializa los valores a los que se les pase por parametro
    def initialize(operation = "", &block)
      @name= operation
      @MatrizClass = ""
      @salida = 0 
      @Matriz = []
      instance_eval &block
    end

    def operacion(opt)
      @name = opt
    end
    
  end
end
