 #!/bin/bash

# Função para realizar o scan em um diretório SMB
scan_directory() {
    smbclient //"$1"/"$2" -U "$3%$4" -c "recurse; lcd $5; prompt OFF; mget $6"
}

# Solicitar informações ao usuário
read -p "Digite o endereço do servidor SMB (ex: //servidor/compartilhamento): " server
read -p "Digite o nome de usuário: " username
read -s -p "Digite a senha: " password
echo

read -p "Digite o diretório SMB a ser verificado: " smb_directory
read -p "Digite o diretório local para salvar os arquivos: " local_directory
read -p "Digite o nome ou padrão do arquivo a ser procurado: " file_pattern

# Realizar o scan no diretório SMB
scan_directory "$server" "$smb_directory" "$username" "$password" "$local_directory" "$file_pattern"

echo "Scan concluído. Arquivos encontrados foram salvos em $local_directory"

