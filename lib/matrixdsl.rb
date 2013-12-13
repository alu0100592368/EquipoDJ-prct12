require "./lib/matrixlpp/matriz.rb"
require "./lib/matrixlpp/matriz_dispersa.rb"
require "./lib/matrixlpp/matriz_densa.rb"

  class MatrixDSL
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

    def operando(fil1,fil2)
      n = fil1.size
      m = fil2.size
      case @MatrizClass
        when "densa" 
          @Matriz << Matrixlpp::Matriz_Densa.new(n,m,[fil1,fil2])
        when "dispersa" 
          @Matriz << Matrixlpp::Matriz_Dispersa.new(n,m,[fil1,fil2])
      end 
    end

    def run
      case @name
        when "suma"
          resultado = (@Matriz[0]+@Matriz[1]).to_s
      end
      
      if @salida == 1
        mostrar(resultado)
      else
        return resultado
      end                  
    end

    def mostrar(res)
      case @name
        when "suma"
          printf "A:\t%s\ + t%s == t%s", @Matriz[0].to_s, @Matriz[1].to_s, res
      end
    end