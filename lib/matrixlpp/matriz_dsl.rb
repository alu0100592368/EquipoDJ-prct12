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
    
    def opcion(opt)
      case opt
        when "densa"  
          @MatrizClass = "densa"
        when "dispersa" 
          @MatrizClass = "dispersa"
        when "consola"
          @salida = 1
        when "matrix"
          @salida = 0
        end               
      end
    end
    
end
