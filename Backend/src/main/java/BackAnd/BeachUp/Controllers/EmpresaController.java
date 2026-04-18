package BackAnd.BeachUp.Controllers;

import BackAnd.BeachUp.DTO.EmpresaCadastroDTO;
import BackAnd.BeachUp.DTO.EmpresaResponseDTO;
import BackAnd.BeachUp.Services.TokenService;
import BackAnd.BeachUp.Services.EmpresaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/contratante")
public class EmpresaController {

    @Autowired
    private EmpresaService service;

    @Autowired
    private TokenService tokenService;

    @Autowired
    private AuthenticationManager authenticationManager;

    @PostMapping("/cadastro")
    public EmpresaResponseDTO create(@RequestBody EmpresaCadastroDTO dto){
        return service.create(dto);
    }

    @GetMapping
    public List<EmpresaResponseDTO> getAll(){
        return service.getAll();
    }

    @GetMapping("/{id}")
    public EmpresaResponseDTO getById(@PathVariable Long id){
        return service.getById(id);
    }

    @PutMapping("/{id}")
    public EmpresaResponseDTO putById(@PathVariable Long id, @RequestBody EmpresaCadastroDTO dto){
        return service.putById(id, dto);
    }

    @DeleteMapping("/{id}")
    public void deleteById(@PathVariable Long id){
        service.deleteById(id);
    }

}
