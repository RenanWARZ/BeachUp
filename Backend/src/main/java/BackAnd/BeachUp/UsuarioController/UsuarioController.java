package BackAnd.BeachUp.UsuarioController;

import BackAnd.BeachUp.DTO.AutenticacaoDTO;
import BackAnd.BeachUp.DTO.LoginResponseDTO;
import BackAnd.BeachUp.DTO.UsuarioCadastroDTO;
import BackAnd.BeachUp.DTO.UsuarioResponseDTO;
import BackAnd.BeachUp.UsuarioModel.Usuario;
import BackAnd.BeachUp.UsuarioService.TokenService;
import BackAnd.BeachUp.UsuarioService.UsuarioService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/contratante")
public class UsuarioController {

    @Autowired
    private UsuarioService service;

    @Autowired
    private TokenService tokenService;

    @Autowired
    private AuthenticationManager authenticationManager;

    @PostMapping ("/login")
    public ResponseEntity login(@RequestBody AutenticacaoDTO data){
        var usernamePassword = new UsernamePasswordAuthenticationToken(data.email(),data.senha());
        var auth = this.authenticationManager.authenticate(usernamePassword);

        var token = tokenService.generateToken((UserDetails) auth.getPrincipal());

        return ResponseEntity.ok(new LoginResponseDTO(token));
    }

    @PostMapping("/cadastro")
    public UsuarioResponseDTO create(@RequestBody UsuarioCadastroDTO dto){
        return service.create(dto);
    }

    @GetMapping
    public List<UsuarioResponseDTO> getAll(){
        return service.getAll();
    }

    @GetMapping("/{id}")
    public UsuarioResponseDTO getById(@PathVariable Long id){
        return service.getById(id);
    }

    @PutMapping("/{id}")
    public UsuarioResponseDTO putById(@PathVariable Long id, @RequestBody UsuarioCadastroDTO dto){
        return service.putById(id, dto);
    }

    @DeleteMapping("/{id}")
    public void deleteById(@PathVariable Long id){
        service.deleteById(id);
    }

}
