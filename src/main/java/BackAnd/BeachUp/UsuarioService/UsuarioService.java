package BackAnd.BeachUp.UsuarioService;


import BackAnd.BeachUp.DTO.UsuarioCadastroDTO;
import BackAnd.BeachUp.DTO.UsuarioResponseDTO;
import BackAnd.BeachUp.UsuarioModel.Usuario;
import BackAnd.BeachUp.UsuarioRepository.UsuarioRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class UsuarioService {

    @Autowired
    private  UsuarioRepository repository;

    @Autowired
    private BCryptPasswordEncoder passwordEncoder;

    public UsuarioResponseDTO converterParaResponseDTO(Usuario usuario){
        return new UsuarioResponseDTO(
                usuario.getId(),
                usuario.getNome(),
                usuario.getEmail(),
                usuario.getCnpj()
        );
    }

    public UsuarioResponseDTO create(UsuarioCadastroDTO dto){

        if(!dto.getSenha().equals(dto.getConfirmarSenha())){
            throw new RuntimeException("Senha inválida");
        }
        if (repository.findByEmail(dto.getEmail()).isPresent()){
            throw new RuntimeException("Email já cadastrado");
        }
        Usuario usuario = new Usuario();
        usuario.setNome(dto.getNome());
        usuario.setEmail(dto.getEmail());
        usuario.setSenha(passwordEncoder.encode(dto.getSenha()));
        usuario.setCnpj(dto.getCnpj());

        Usuario salvo = repository.save(usuario);

        return converterParaResponseDTO(salvo);
    }

    public List<UsuarioResponseDTO> getAll(){
        return repository.findAll()
                .stream()
                .map(this::converterParaResponseDTO)
                .collect(Collectors.toList());
    }
    public UsuarioResponseDTO getById (Long id){
        Usuario usuario = repository.findById(id)
                .orElseThrow(()-> new RuntimeException("Usuário não encontrado"));
         return converterParaResponseDTO(usuario);
    }

    public UsuarioResponseDTO putById(Long id, UsuarioCadastroDTO dto){

        Usuario usuario = repository.findById(id)
                .orElseThrow(()-> new RuntimeException("Usuario não encontrado"));

        if (!dto.getSenha().equals(dto.getConfirmarSenha())){
            throw new RuntimeException("Senha inválida");
        }

        repository.findByEmail(dto.getEmail())
                .filter(u ->!u.getId().equals(id))
                .ifPresent(u->{
                    throw new RuntimeException("Email já cadastrado");
                });
        usuario.setNome(dto.getNome());
        usuario.setEmail(dto.getEmail());
        usuario.setSenha(passwordEncoder.encode(dto.getSenha()));
        usuario.setCnpj(dto.getCnpj());

        Usuario atualizado = repository.save(usuario);

        return converterParaResponseDTO(atualizado);
    }

    public void deleteById(Long id){
        Usuario usuario = repository.findById(id)
                .orElseThrow(() -> new RuntimeException("Usuario não encontrado"));
        repository.delete(usuario);
    }
}
