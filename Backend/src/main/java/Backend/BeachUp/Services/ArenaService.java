package Backend.BeachUp.Services;

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

    public ArenaModel create (Long empresaid, ArenaModel arenaModel){
        Empresa empresa = empresaRepository.findById(empresaid).orElseThrow(()-> new RuntimeException("Erro ao cadastrar arena(Usuário não encontrado)"));
        arenaModel.setEmpresa(empresa);
        return arenaRepository.save(arenaModel);
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
