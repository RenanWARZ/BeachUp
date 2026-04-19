package Backend.BeachUp.Services;

import Backend.BeachUp.Models.ArenaModel;
import Backend.BeachUp.Models.QuadraModel;
import Backend.BeachUp.Repositorys.ArenaRepository;
import Backend.BeachUp.Repositorys.QuadraRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class QuadraService {

    @Autowired
    private QuadraRepository quadraRepository;

    @Autowired
    private ArenaRepository arenaRepository;

    public QuadraModel create(Long arenaid, QuadraModel quadraModel){
        ArenaModel arenaModel = arenaRepository.findById(arenaid).orElseThrow(()-> new RuntimeException("Erro ao cadastrar quadra (Arena não encontrada)"));
        quadraModel.setArenas(arenaModel);
        return quadraRepository.save(quadraModel);
    }
    public QuadraModel getId(Long id){
        return quadraRepository.findById(id).orElseThrow(()-> new RuntimeException("Arena não encontrada"));
    }

    public List<QuadraModel> getAll(){
        return quadraRepository.findAll();
    }

    public QuadraModel update(Long id, QuadraModel quadraModel){
        QuadraModel novaQuadra = quadraRepository.findById(id).get();
        novaQuadra.setNome(quadraModel.getNome());
        novaQuadra.setTipoCobertura(quadraModel.getTipoCobertura());
        return quadraRepository.save(novaQuadra);
    }

    public void delete(Long id){
        quadraRepository.deleteById(id);
    }
}
