package Backend.BeachUp.Services;

import Backend.BeachUp.DTO.ArenaCadastroDTO;
import Backend.BeachUp.DTO.ArenaResponseDTO;
import Backend.BeachUp.DTO.EmpresaResponseDTO;
import Backend.BeachUp.Models.ArenaModel;
import Backend.BeachUp.Models.Empresa;
import Backend.BeachUp.Repositorys.ArenaRepository;
import Backend.BeachUp.Repositorys.EmpresaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ArenaService {

    @Autowired
    private ArenaRepository arenaRepository;

    @Autowired
    private EmpresaRepository empresaRepository;

    public ArenaResponseDTO converterparaDTO(ArenaModel arena){

        Empresa empresa = arena.getEmpresa();

        EmpresaResponseDTO empresaDTO =
                new EmpresaResponseDTO(
                        empresa.getId(),
                        empresa.getNome(),
                        empresa.getEmail(),
                        empresa.getCnpj()
                );

        return new ArenaResponseDTO(arena.getId(),arena.getNome(),arena.getDescricao(), empresaDTO);
    }

    public ArenaModel create(Long empresaid, ArenaCadastroDTO dto){

        Empresa empresa = empresaRepository.findById(empresaid)
                .orElseThrow(() -> new RuntimeException("Empresa não encontrada"));

        ArenaModel arena = new ArenaModel();
        arena.setNome(dto.getNome());
        arena.setDescricao(dto.getDescricao());
        arena.setEmpresa(empresa);

        return arenaRepository.save(arena);
    }

    public ArenaModel getId (Long id){
        return arenaRepository.findById(id).orElseThrow(()-> new RuntimeException("Usuário não encontrado"));
    }

    public List<ArenaModel> getAll(){
        return arenaRepository.findAll();
    }

    public ArenaModel update(Long id, ArenaModel arenaModel){
        ArenaModel novaarena = arenaRepository.findById(id).get();
        novaarena.setNome(arenaModel.getNome());
        novaarena.setDescricao(arenaModel.getDescricao());

        return arenaRepository.save(novaarena);
    }

    public void delete(Long id){
        arenaRepository.findById(id);
    }
}
