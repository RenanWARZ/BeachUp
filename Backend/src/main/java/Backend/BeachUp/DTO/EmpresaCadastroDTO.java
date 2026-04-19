package Backend.BeachUp.DTO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter

public class EmpresaCadastroDTO {
    private String nome;
    private String email;
    private String senha;
    private String confirmarSenha;
    private String cnpj;
}
