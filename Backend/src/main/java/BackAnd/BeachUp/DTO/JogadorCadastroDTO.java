package BackAnd.BeachUp.DTO;


import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class JogadorCadastroDTO {
    private String nome;
    private String email;
    private String senha;
    private String confirmarSenha;
    private String cpf;
}
