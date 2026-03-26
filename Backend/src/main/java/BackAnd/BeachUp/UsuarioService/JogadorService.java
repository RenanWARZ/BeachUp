package BackAnd.BeachUp.UsuarioService;

import BackAnd.BeachUp.DTO.JogadorCadastroDTO;
import BackAnd.BeachUp.DTO.JogadorResponseDTO;
import BackAnd.BeachUp.UsuarioModel.JogadorModel;
import BackAnd.BeachUp.UsuarioRepository.JogadorRepository;
import jakarta.servlet.Filter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class JogadorService {



    @Autowired
    private JogadorRepository repository;

    @Autowired
    private BCryptPasswordEncoder passwordEncoder;

    public JogadorResponseDTO converterParaResponseDTO(JogadorModel jogadorModel) {
        return new JogadorResponseDTO(
                jogadorModel.getId(),
                jogadorModel.getNome(),
                jogadorModel.getEmail(),
                jogadorModel.getCpf()
        );
    }

    public JogadorResponseDTO create(JogadorCadastroDTO dto) {
        if (!dto.getSenha().equals(dto.getConfirmarSenha())) {
            throw new RuntimeException("Senha inválida");
        }
        if (repository.findByEmail(dto.getEmail()).isPresent()) {
            throw new RuntimeException("Email já cadastrado");
        }

        JogadorModel jogadorModel = new JogadorModel();
        jogadorModel.setNome(dto.getNome());
        jogadorModel.setEmail(dto.getEmail());
        jogadorModel.setSenha(passwordEncoder.encode(dto.getSenha()));
        jogadorModel.setCpf(dto.getCpf());

        JogadorModel salvo = repository.save(jogadorModel);

        return converterParaResponseDTO(salvo);
    }

    public List<JogadorResponseDTO> getAll() {
        return repository.findAll()
                .stream()
                .map(this::converterParaResponseDTO)
                .collect(Collectors.toList());
    }

    public JogadorResponseDTO getById(Long id) {
        JogadorModel jogadorModel = repository.findById(id)
                .orElseThrow(() -> new RuntimeException("Usuário não encontrado"));
        return converterParaResponseDTO(jogadorModel);
    }

    public JogadorResponseDTO putById(Long id, JogadorCadastroDTO dto) {
        JogadorModel jogadorModel = repository.findById(id)
                .orElseThrow(() -> new RuntimeException("Usuário não encontrado"));
        if (dto.getNome() != null) {
            jogadorModel.setNome(dto.getNome());
        }
        if (dto.getEmail() != null) {
            repository.findByEmail(dto.getEmail())
                    .filter(u -> !u.getId().equals(id))
                    .ifPresent(u -> {
                        throw new RuntimeException("Email já cadastrado");
                    });

            jogadorModel.setEmail(dto.getEmail());
        }
        if (dto.getSenha() != null) {
            if (!dto.getSenha().equals(dto.getConfirmarSenha())) {
                throw new RuntimeException("Senhas não coincidem ");
            }
            jogadorModel.setSenha(passwordEncoder.encode(dto.getSenha()));
        }
        if (dto.getCpf() != null) {
            jogadorModel.setCpf(dto.getCpf());
        }
        JogadorModel atualizado = repository.save(jogadorModel);

        return converterParaResponseDTO(atualizado);
    }

    public void deleteById(Long id){
        JogadorModel jogadorModel = repository.findById(id)
                .orElseThrow(()-> new RuntimeException("Usuário não encontrado"));
        repository.delete(jogadorModel);
    }
}
