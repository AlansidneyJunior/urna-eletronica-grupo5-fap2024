def display_menu
    puts "------------------URNA-ELETRONICA------------------"
    puts "1 - INICIAR VOTACAO"
    puts "2 - ENCERRAR SESSAO"
end 

def start_voting
    show_candidates()
    validate_vote()
end

def show_candidates

    puts "|----------LISTA DE CANDIDATOS----------|"
    puts "|    DIGITO    |          NOME          |"
    puts "|---------------------------------------|"
    puts "|      21      |          JOAO          |"
    puts "|      23      |          MARIA         |"
    puts "|      10      |          PEDRO         |"
    puts "|       0      |       VOTO BRANCO      |"
    puts "|       1      |       VOTO NULO        |"
    puts "|---------------------------------------|\n\n"

    print " DIGITE O NUMERO DO CANDIDATO QUE DESEJA VOTAR: "

end

def validate_vote()

    vote = gets.chomp

    if vote.match?(/^\d+$/) # apenas dígitos
        vote = vote.to_i
        confirm_vote(vote)#implementar com coleções
        compute_vote(vote)
    else
        puts "N DIGITO!"
    end
end

def compute_vote(vote)
    #computar voto
end

def confirm_vote(vote)
    #confirmar voto
end

#INICIO DO PROGRAMA    
display_menu

option = gets.chomp.to_i

case option
when 1
    start_voting()
when 2
    finish_session()
end