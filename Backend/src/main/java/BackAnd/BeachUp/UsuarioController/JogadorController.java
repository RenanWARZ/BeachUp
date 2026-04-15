package BackAnd.BeachUp.UsuarioController;

import BackAnd.BeachUp.DTO.*;
import BackAnd.BeachUp.UsuarioModel.JogadorModel;
import BackAnd.BeachUp.UsuarioService.JogadorService;
import BackAnd.BeachUp.UsuarioService.TokenService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/jogador")
public class JogadorController {
    @Autowired
    private JogadorService service;

    @Autowired
    private TokenService tokenService;

    @Autowired
    private AuthenticationManager authenticationManager;

    @PostMapping("/cadastro")
    public JogadorResponseDTO create(@RequestBody JogadorCadastroDTO dto){
        return service.create(dto);
    }

    @GetMapping
    public List<JogadorResponseDTO> getAll(){
        return service.getAll();
    }

    @GetMapping("/{id}")
    public JogadorResponseDTO getById(@PathVariable Long id){
        return service.getById(id);
    }

    @PutMapping("/{id}")
    public JogadorResponseDTO putById(@PathVariable Long id, @RequestBody JogadorCadastroDTO dto){
        return  service.putById(id, dto);
    }

    @DeleteMapping("/{id}")
    public void deleteById(@PathVariable Long id){
        service.deleteById(id);
    }
}
