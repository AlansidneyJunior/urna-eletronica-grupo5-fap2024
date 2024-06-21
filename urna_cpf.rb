def start_urna()

    clear_screen()
    puts $votes #descomente para ver total de votos atuais durante a sessão
    puts $total_votes
    display_menu

    option = gets.chomp.to_i

    case option
    when 1
        start_voting()
    when 2
        finish_session()
    end
end

def display_menu()
    
    puts "------------------URNA-ELETRONICA------------------"
    puts "1 - INICIAR VOTACAO"
    puts "2 - ENCERRAR SESSAO"
end 

def start_voting()
    #cpf = get_cpf() #receber cpf em uma função
    cpf_valid = check_cpf() #true caso seja válido
    if cpf_valid
        show_candidates()
        validate_vote()
    else
        puts "ESSE CPF É INVALIDO OU JA FOI USADO NESTA VOTACAO!\nTENTE NOVAMENTE"
    end
end

def get_cpf()
    #receber cpf e converter para lista de números (Eu acho...)
end

def check_cpf()
    #checar se ja votou, ou seja, está na lista $voters
    #validar cpf
    return true
end

def show_candidates()
    clear_screen

    puts "|----------LISTA DE CANDIDATOS----------|"
    puts "|    DIGITO    |          NOME          |"
    puts "|---------------------------------------|"
    puts "|      21      |          JOAO          |"
    puts "|      23      |          MARIA         |"
    puts "|      10      |          PEDRO         |"
    puts "|       0      |          BRANCO        |"
    puts "|       1      |          NULO          |"
    puts "|---------------------------------------|\n\n"

    print " DIGITE O NUMERO DO CANDIDATO QUE DESEJA VOTAR: "

end

def validate_vote()

    vote = gets.chomp

    if vote.match?(/^\d+$/) # apenas dígitos
        vote = vote.to_i
        if [21,23,10,0,1].include?(vote)
            confirm_vote(vote)
        else #digito inválido = voto nulo
            confirm_vote(1)
        end
    else
        puts "Entrada inválida. Por favor, digite apenas números."
        start_voting
    end
end

def confirm_vote(vote)
    #confirmar voto
    candidate = $candidates[vote]
    print "CONFIRMAR VOTO EM #{candidate}? (S/N):  "
    
    confirm = gets.chomp
    if confirm.upcase == 'S'
        compute_vote(candidate)
        puts "VOTO FEITO COM SUCESSO!"
        
        start_urna
    else
        start_voting
    end

end

def compute_vote(candidate)
    #computar voto
    $votes[candidate] += 1
    #adicionar o cpf que votou na lista $voters
    $total_votes += 1

end

def clear_screen()
    clear_command = Gem.win_platform? ? 'cls' : 'clear'
    sleep(1)
    system(clear_command)
end

#VARIÁVEIS GLOBAIS

#Votos totais
$total_votes = 0

#Eleitores = CPFs que ja votaram
$voters = []

#Votos por candidatos
$votes = {
    "JOAO" => 0, 
    "MARIA" => 0,
    "PEDRO" => 0,
    "BRANCO" => 0,
    "NULO" => 0
}

#Candidatos
$candidates = {
    21 => "JOAO", 
    23 => "MARIA",
    10 => "PEDRO",
    0 => "BRANCO",
    1 => "NULO"
}

start_urna()