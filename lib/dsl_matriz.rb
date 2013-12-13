#Clase Matrix DSL 
class MatrixDSL 
require "./matriz.rb"

  attr_accessor :op, :name, :modo, :tipo_op
  
  def initialize(name,&block)
    self.name=name        
    self.op=[]             
    self.modo = []         
    self.tipo_op={}
    @i = 0;
    instance_eval &block  
  end
  
  def to_s
		 
	 resul = case name
   when "Suma" then op[0]+op[1]
   when "Resta" then op[0]-op[1]
   when "Multiplicacion" then op[0]*op[1]
   end
		
     if modo[0] == "console" 
        puts name
        puts resul
     else
			 puts "Creando fichero..."
			 i=0
			 f= File.open('matriz.txt', 'w') 
			 f.puts name
			 f.puts resul
			 puts "fichero terminado"
		end  
	end
  
  def option(mod)
     self.modo[@i]= mod
     @i += 1
  end
  
  def operand(arrays)
     if modo[1] == "Densa" 
        m= Matriz.new(arrays)
     else
        m= MatrizDispersa.new(arrays)
     end
     self.op << m
  end    
  
end

ejemplo = MatrixDSL.new("Suma") do 
  option "console"
  option "Dispersa"

  operand [[0,0,0],[3,2,4],[0,0,0]]  
  operand [[0,0,0],[5,3,1],[0,0,0]]  
   

end

puts ejemplo
