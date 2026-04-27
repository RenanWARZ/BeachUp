package Backend.BeachUp.Controllers;

import Backend.BeachUp.DTO.ArenaCadastroDTO;
import Backend.BeachUp.DTO.ArenaResponseDTO;
import Backend.BeachUp.Models.ArenaModel;
import Backend.BeachUp.Services.ArenaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/arenas")
public class ArenaController {

    @Autowired
    private ArenaService arenaService;

    @PostMapping("/{empresaid}")
    public ResponseEntity<ArenaResponseDTO> create(@PathVariable Long empresaid, @RequestBody ArenaCadastroDTO dto){
        ArenaModel arena = arenaService.create(empresaid, dto);
        return ResponseEntity.ok(arenaService.converterparaDTO(arena));
    }

    @GetMapping
    public ResponseEntity<List<ArenaModel>> getAll(){
        return ResponseEntity.ok().body(arenaService.getAll());
    }

    @GetMapping("/{id}")
    public ResponseEntity<ArenaModel> getId (@PathVariable Long id){
        return ResponseEntity.ok().body(arenaService.getId(id));
    }

    @PutMapping("/{id}")
    public ResponseEntity<ArenaModel> update (@PathVariable Long id, ArenaModel arenaModel){
        arenaModel.setId(id);
        return ResponseEntity.ok().body(arenaService.update(id, arenaModel));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> delete(@PathVariable Long id){
        arenaService.delete(id);
        return ResponseEntity.noContent().build();
    }
}
