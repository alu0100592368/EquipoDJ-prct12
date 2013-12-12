filename = ARGV.shift

calculo = File.open(filename).read
calculo = <<"CALCULO"
        require './lib/matrixlpp.rb'
        MatrixDSL.new() do
                #{calculo}
        end
CALCULO
matrixDSL = eval calculo

matrixDSL.run