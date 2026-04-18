package BackAnd.BeachUp.Services;


import BackAnd.BeachUp.DTO.EmpresaCadastroDTO;
import BackAnd.BeachUp.DTO.EmpresaResponseDTO;
import BackAnd.BeachUp.Models.Empresa;
import BackAnd.BeachUp.Repositorys.EmpresaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class EmpresaService {



    @Autowired
    private EmpresaRepository repository;

    @Autowired
    private BCryptPasswordEncoder passwordEncoder;

    public EmpresaResponseDTO converterParaResponseDTO(Empresa empresa){
        return new EmpresaResponseDTO(
                empresa.getId(),
                empresa.getNome(),
                empresa.getEmail(),
                empresa.getCnpj()
        );
    }

    public EmpresaResponseDTO create(EmpresaCadastroDTO dto){

        if(!dto.getSenha().equals(dto.getConfirmarSenha())){
            throw new RuntimeException("Senha inválida");
        }
        if (repository.findByEmail(dto.getEmail()).isPresent()){
            throw new RuntimeException("Email já cadastrado");
        }
        Empresa empresa = new Empresa();
        empresa.setNome(dto.getNome());
        empresa.setEmail(dto.getEmail());
        empresa.setSenha(passwordEncoder.encode(dto.getSenha()));
        empresa.setCnpj(dto.getCnpj());

        Empresa salvo = repository.save(empresa);

        return converterParaResponseDTO(salvo);
    }

    public List<EmpresaResponseDTO> getAll(){
        return repository.findAll()
                .stream()
                .map(this::converterParaResponseDTO)
                .collect(Collectors.toList());
    }
    public EmpresaResponseDTO getById (Long id){
        Empresa empresa = repository.findById(id)
                .orElseThrow(()-> new RuntimeException("Usuário não encontrado"));
         return converterParaResponseDTO(empresa);
    }

    public EmpresaResponseDTO putById(Long id, EmpresaCadastroDTO dto){

        Empresa empresa = repository.findById(id)
                .orElseThrow(() -> new RuntimeException("Usuario não encontrado"));

        if (dto.getNome() != null) {
            empresa.setNome(dto.getNome());
        }

        if (dto.getEmail() != null) {
            repository.findByEmail(dto.getEmail())
                    .filter(u -> !u.getId().equals(id))
                    .ifPresent(u -> {
                        throw new RuntimeException("Email já cadastrado");
                    });

            empresa.setEmail(dto.getEmail());
        }

        if (dto.getSenha() != null) {
            if (!dto.getSenha().equals(dto.getConfirmarSenha())) {
                throw new RuntimeException("Senhas não coincidem ");
            }
            empresa.setSenha(passwordEncoder.encode(dto.getSenha()));
        }

        if (dto.getCnpj() != null) {
            empresa.setCnpj(dto.getCnpj());
        }

        Empresa atualizado = repository.save(empresa);

        return converterParaResponseDTO(atualizado);
    }

    public void deleteById(Long id){
        Empresa empresa = repository.findById(id)
                .orElseThrow(() -> new RuntimeException("Usuario não encontrado"));
        repository.delete(empresa);
    }


}
