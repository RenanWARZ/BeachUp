package Backend.BeachUp.Controllers;


import Backend.BeachUp.DTO.AutenticacaoDTO;
import Backend.BeachUp.DTO.LoginResponseDTO;
import Backend.BeachUp.Services.TokenService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/auth")
public class AuthController {
    @Autowired
    private AuthenticationManager authenticationManager;

    @Autowired
    private TokenService tokenService;

    @PostMapping("/login")
    public ResponseEntity login(@RequestBody AutenticacaoDTO data){

        var usernamePassword = new UsernamePasswordAuthenticationToken(
                data.email(), data.senha()
        );

        var auth = authenticationManager.authenticate(usernamePassword);

        var token = tokenService.generateToken((UserDetails) auth.getPrincipal());

        return ResponseEntity.ok(new LoginResponseDTO(token));
    }

}
