candX = 0
candY = 0
candZ = 0
brancos = 0
nulos = 0
vitorioso = ""

def total_votos(candX, candY, candZ, brancos, nulos)
  candX + candY + candZ + brancos + nulos
end

loop do
  system "clear"
  puts "******* Menu: *******"
  puts "====================="
  puts "1 - Votar."
  puts "2 - Encerrar votação."

  escolha = gets.chomp.to_i

  case escolha
  when 1
    candidato_confirmado = false

    until candidato_confirmado
      candidato = ""  
      voto = nil

      loop do
        system "clear"
        puts "Escolha o(a) seu(sua) candidato(a): \n 89 - Pedro \n 47 - José \n 51 - Maria \n 0 - Branco"

        print "Digite o número do(a) candidato(a): "
        voto = gets.chomp

        if voto.match?(/\A\d+\z/)
          voto = voto.to_i

          case voto
          when 89
            candidato = 'Candidato(a) Pedro'
          when 47
            candidato = 'Candidato(a) José'
          when 51
            candidato = 'Candidata Maria'
          when 0
            candidato = 'Branco'
          else
            candidato = 'Nulo'
          end

          break
        else
          puts "Entrada inválida. Por favor, digite apenas números."
          sleep(2)
        end
      end

      loop do
        system "clear"
        puts "Confirma voto para #{candidato}? (S/N)"
        confirmacao = gets.chomp.upcase

        case confirmacao
        when 'S'
          if voto == 89
            candX += 1
          elsif voto == 47
            candY += 1
          elsif voto == 51
            candZ += 1
          elsif voto == 0
            brancos += 1
          else
            nulos += 1
          end

          candidato_confirmado = true
          break
        when 'N'
          break 
        else
          puts "Opção inválida. Digite S para confirmar ou N para corrigir o voto."
          sleep(2)
        end
      end
    end

  when 2
    break
  else
    puts "Opção inválida. Escolha 1 para votar ou 2 para encerrar a votação."
    sleep(2)
  end
end

system "clear"

if candX > candY && candX > candZ
  vitorioso = 'Candidato(a) Pedro'
elsif candY > candX && candY > candZ
  vitorioso = 'Candidato(a) José'
elsif candZ > candX && candZ > candY
  vitorioso = 'Candidata Maria'
else
  vitorioso = 'Aconteceu um Empate'
end

puts "O ganhador desta eleição é:\n\n *****  #{vitorioso}  *****\n"
puts "\n#{total_votos(candX, candY, candZ, brancos, nulos)} votos totalizados, sendo:
\n\n Candidato(a) Pedro: #{candX} votos.
 Candidato(a) José: #{candY} votos.
 Candidata Maria: #{candZ} votos.
 Brancos e nulos: #{brancos + nulos} votos.
 Sendo:
  Brancos: #{brancos}
  Nulos: #{nulos}"
