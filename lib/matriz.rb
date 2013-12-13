# coding: utf-8
# = matriz.rb
#  Autores:: Hamilton Steven Cubillos García & Marcos Díaz García
#  Github:: https://github.com/alu0100545630/prct11

# == Construcción de una gema.
#  -> Se pretende construir una gema que contenga los principales métodos para matrices densas y dispersas siguiendo la filosofía de la programación funcional.
#  -> Utilización de la gema Rdoc para generar documentación.
#

module Operatoria
     
   #Funcion que asigna un valor k a una posicion i,j dentro de la matriz
   def []=(i, j, k)
      matriz[i][j] = k
   end
  
    #Sobrecargado el + para poder sumar 2 matrices
   def +(other)
      raise ArgumentError, "La longitud de las matrices no coincide." unless @filas == other.filas && @columnas == other.columnas
      sum = Matriz.new(matriz) #inicializas el vector sum con el primer con el primer
       0.upto(filas-1) do |i|
          0.upto(columnas-1) do |j|
            sum.matriz[i][j] = self.matriz[i][j] + other.matriz[i][j]
         end
      end
      return sum #devuelve un tipo array modificando el objeto m1 si se hace m3=m1+m2 -> Se necesita q sea tipo Matriz
   end
   
   #Sobrecargado el - para poder restar 2 matrices
   def -(other)
      raise ArgumentError, "La longitud de las matrices no coincide." unless @filas == other.filas && @columnas == other.columnas
      resta = Matriz.new(matriz)
      0.upto(filas-1) do |i|
         0.upto(columnas-1) do |j|
            resta.matriz[i][j] = self.matriz[i][j] - other.matriz[i][j]
         end
      end
      return resta #devuelve un tipo matriz modificando el objeto m1 si se hace m3=m1+m2
   end
   

   def Producto_escalar (other)
      mul = Matriz.new(matriz)
      self.filas.times do |i|
         self.columnas.times do |j|
            mul.matriz[i][j] = self.matriz[i][j] * other
         end
      end
      return mul
   end
   
   #Para comprobar que dos matrices son equivalentes,primero se comprueba sus dimensiones. Si tienen las mismas dimensiones se comprueba que el valor de ambas matrices sean iguales en las mismas posiciones,si esto es así se devuelve true,false en otro caso.
   def ==(other)
      dev=true
      if ((self.filas.size==other.filas.size) && (self.columnas.size==other.columnas.size))
         self.filas.times do |i|
            self.columnas.times do |j|
               if (self.matriz[i][j] != other.matriz[i][j])
         dev=false
         else
         end
         end
         end
      else
         dev=false
      end
      return dev
   end
   
   
   #Realiza el opuesto de una matriz
   def -@
   op = Matriz.new(matriz)
      self.filas.times do |i|                 
         self.columnas.times do |j|
            op.matriz[i][j] = -self.matriz[i][j]
         end
      end
      return op
   
   end
   
   #Dos matrices son multiplicables si el numero de columnas de A coincide con el numero de filas de B
   def * (other)
      raise ArgumentError, "La longitud de las matrices no coincide." unless @columnas == other.filas
      elemento = Array.new
      acumulado = 0
      self.filas.times do |i|
         elemento_fila = Array.new
         other.columnas.times do |j|
            acumulado = 0
            self.columnas.times do |k|
               suma = @matriz[i][k] * other.matriz[k][j]
               acumulado = suma + acumulado
            end
            elemento_fila << acumulado
         end
         elemento << elemento_fila
      end
      Matriz.new(elemento)
   end
end
  
# ===Clase Matriz
#
#   Es la clase base de nuestra aplicación,en ella se definen los principales métodos para operar con matrices(mediante el modulo operatoria).
#    
class Matriz
   require "./racional.rb" #definicion de la clase racional
   
   include Operatoria
   #atributos de la clase
   attr_accessor :matriz, :filas, :columnas
   
   def initialize(matriz)
      @matriz = Array.new(matriz)
      @filas = matriz.size
      @columnas = matriz[0].size
      @n_elementos= (matriz.size * matriz[0].size)*0.6
       n_ceros=0
      filas.times do |i|
         columnas.times do |j|
         if (matriz[i][j]==0)
         n_ceros=n_ceros+1
                        end
      end
      end
      if n_ceros > @n_elementos
         raise RuntimeError, 'La Matriz no es densa'
      end
     
   end
   
   def comprobar (matriz)
   
    n_ceros=0
      filas.times do |i|
         columnas.times do |j|
         if (matriz[i][j]==0)
         n_ceros=n_ceros+1
                        end
      end
      end
      if n_ceros > @n_elementos
         raise RuntimeError, 'La Matriz no es densa'
      end
   end
   
      #Imprime la matrices
   def to_s
      0.upto(filas-1) do |i|
         0.upto(columnas-1) do |j|
           print  "#{self.matriz[i][j]} "
         end
         puts
      end
      puts
   end
      

   def [](i,j)
      matriz[i][j]
   end
   
   def maximo
      max=0;
      filas.times do |i|
         columnas.times do |j|
         if matriz[i][j] > max
         max=matriz[i][j]
         else
         end
         end
      end
      return max
   end
   
   
   def minimo
      min=9999;
      filas.times do |i|
         columnas.times do |j|
         if matriz[i][j] < min
         min=matriz[i][j]
         else
         end
         end
      end
      return min
   end
   
end

# ===Clase MatrizDensa
#
#   Es la clase base de nuestra aplicación,en ella se definen los principales métodos para operar con matrices.
#   Alguno de los métodos son :
#       to_s: Método que imprime por patalla una matriz recorriendo uno a uno los elementos de dicha matriz.
#       +(other): Permite sumar un objeto MatrizDensa (self) con otro pasado por parámetro.Devuelve la suma de dichos elementos que es un objeto MatrizDensa o MatrizDispersa.
#       -(other): Permite restar un objeto MatrizDensa con otro pasado por parámetro.Devuelve la resta de dichos elementos como un objeto MatrizDensa o MatrizDispersa.
#       *(other): Permite multiplicar un objeto MatrizDensa(self) con otro pasado por parámetro.Devuelve un objeto MatrizDensa como multiplicación de ambas matrices .
#       maximo: Devuelve el mayor elemento dentro de una matriz recorriendo la misma y quedándose con el mayor elemento encontrado.
#       maximo: Devuelve el menor elemento dentro de una matriz recorriendo la misma y quedándose con el menor elemento encontrado.

class MatrizDensa < Matriz

        def +(other)
        sumam = Array.new(@filas,0){Array.new(@columnas,0)}
        0.upto(filas-1) do |i|
         0.upto(columnas-1) do |j|
             if (other.hash_no_ceros.key?("#{i}#{j}"))
                    sumam[i][j] = other.hash_no_ceros["#{i}#{j}"] + matriz[i][j]
             else
                    sumam[i][j] = matriz[i][j]
             end
          end
       end
       suma=MatrizDensa.new(sumam)
       return suma                
        end
  
end

# ===Clase MatrizDispersa
#
#   Es la clase hija en la que utilizamos un hash para almacenar las posiciones y los valores de los elementos que no son ceros
#   Se redefinen los métodos heredados.
#       to_s: Método que imprime por patalla una matriz recorriendo uno a uno los elementos de dicha matriz.
#       +(other): Permite sumar un objeto MatrizDispersa (self) con otro pasado por parámetro.Devuelve la suma de dichos elementos que es un objeto MatrizDensa o MatrizDispersa.
#       -(other): Permite restar un objeto MatrizDispersa con otro pasado por parámetro.Devuelve la resta de dichos elementos como un objeto MatrizDensa o MatrizDispersa.
#       *(other): Permite multiplicar un objeto MatrizDensa(self) con otro pasado por parámetro.Devuelve un objeto MatrizDensa como multiplicación de ambas matrices .
#       maximo: Devuelve el mayor elemento dentro de una matriz recorriendo la misma y quedándose con el mayor elemento encontrado.
#       maximo: Devuelve el menor elemento dentro de una matriz recorriendo la misma y quedándose con el menor elemento encontrado.
#

class MatrizDispersa < Matriz
    #atributos de la clase
    attr_accessor :hash_no_ceros, :filas, :columnas
    
   def initialize(matriz)
      @filas = matriz.size
      @columnas = matriz[0].size
      @hash_no_ceros={}
       
     #comprobamos que la matriz es dispersa o no
     @n_elementos= (matriz.size * matriz[0].size)*0.6
     n_ceros=0
      filas.times do |i|
         columnas.times do |j|
                                                if (matriz[i][j]==0)
                                                         n_ceros=n_ceros+1
                                                else
                                                         pos_no_cero="#{i}#{j}"
                                                         @hash_no_ceros[pos_no_cero]=matriz[i][j]
                                                end
                                        end
      end
      
      if n_ceros < @n_elementos
         raise RuntimeError, 'La Matriz no es dispersa'
      else
      end
      
   end
   
   
   def comprobar (hash)
        if hash.length > ((@filas * @columnas)*0.4)
                false
        else
                true
   end
   end
    
    def to_s
       filas.times do |i|
         columnas.times do |j|
         if (hash_no_ceros.key?("#{i}#{j}"))
         print hash_no_ceros["#{i}#{j}"]
         print " "
         else
         print "0 "
         end
         end
         puts
       end
    end #def to_s
    
    
    def +(other)
      raise TypeError, "La matriz other no es dispersa" unless other.instance_of? MatrizDispersa
      raise ArgumentError, "La longitud de las matrices no coincide." unless @filas == other.filas && @columnas == other.columnas
      suma=MatrizDispersa.new(Array.new(@filas,0){Array.new(@columnas,0)})
      suma.hash_no_ceros = (hash_no_ceros.merge(other.hash_no_ceros){|key,oldval,newval| oldval+newval}).clone
      if comprobar(suma.hash_no_ceros)
         return suma
      else
         m = Array.new(@filas,0){Array.new(@columnas,0)}
         suma.hash_no_ceros.map {|key, value| m[(key[0]).to_i][(key[1]).to_i] = value }
         sum = MatrizDensa.new(m)
         return sum
      end
      
                        
    end
    
     def -(other)
      raise TypeError, "La matriz other no es dispersa" unless other.instance_of? MatrizDispersa
      raise ArgumentError, "La longitud de las matrices no coincide." unless @filas == other.filas && @columnas == other.columnas
      resta=MatrizDispersa.new(Array.new(@filas,0){Array.new(@columnas,0)})
      resta.hash_no_ceros = (self.hash_no_ceros.merge(other.hash_no_ceros){|key,oldval,newval| oldval-0-newval}).clone
      if comprobar(resta.hash_no_ceros)
         return resta
      else
           m = Array.new(@filas,0){Array.new(@columnas,0)}
           resta.hash_no_ceros.collect {|key, value| m[(key[0]).to_i][(key[1]).to_i] = value }
           res = MatrizDensa.new(m)
           return res
       end
      end
    
   def ==(other)
     hash_no_ceros == other.hash_no_ceros
   end

   def *(other)
      raise TypeError, "La matriz other no es dispersa" unless other.instance_of? MatrizDispersa
      raise ArgumentError, "La longitud de las matrices no coincide." unless @columnas == other.filas
      sum=0;
      elemento = Hash.new {}
      mult=0
      self.filas.times do |i|
         other.columnas.times do |j|
            acumulado = 0
            self.columnas.times do |k|
               if ( (self.hash_no_ceros.key?("#{i}#{k}")) && (other.hash_no_ceros.key?("#{k}#{j}")))
					mult=self.hash_no_ceros["#{i}#{k}"] * other.hash_no_ceros["#{k}#{j}"]
				else
         #sumarle 0 al acumulado
                 if (self.hash_no_ceros.key?("#{i}#{k}") == false )
                 mult=0;
                 else
                 mult=0;
                 end
         end
         acumulado+=mult
            end
         pos="#{i}#{j}"
         if (acumulado!=0)
         elemento[ pos ] = acumulado #se queda con el ultimo valor
         else
         end
         end
      end
      return(elemento)
   end
   
   def maximo
      max=0;
      filas.times do |i|
         columnas.times do |j|
            if (hash_no_ceros.key?("#{i}#{j}"))
         if (hash_no_ceros["#{i}#{j}"] > max)
         max=hash_no_ceros["#{i}#{j}"]
         else
         end
         else
         end
         end
      end
      return max
   end
   
   def minimo
      min=0; #si es una matriz dispersa me interesa buscar los numeros menores que 0
      filas.times do |i|
         columnas.times do |j|
            if (hash_no_ceros.key?("#{i}#{j}"))
         if (hash_no_ceros["#{i}#{j}"] < min)
         min=hash_no_ceros["#{i}#{j}"]
         else
         end
         else
         end
         end
      end
      return min
   end
end

