package BackAnd.BeachUp.DTO;


import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class UsuarioResponseDTO {

    private  Long id;
    private String nome;
    private String email;
    private String cnpj;

}
