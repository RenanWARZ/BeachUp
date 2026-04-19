package Backend.BeachUp.Controllers;

import Backend.BeachUp.Models.QuadraModel;
import Backend.BeachUp.Services.QuadraService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/quadras")
public class QuadraController {

    @Autowired
    private QuadraService quadraService;

    @PostMapping("{arenaid}")
    public ResponseEntity create (@PathVariable Long arenaid,@RequestBody QuadraModel quadraModel){
        return  ResponseEntity.ok().body(quadraService.create(arenaid, quadraModel));
    }

    @GetMapping
    public  ResponseEntity<List<QuadraModel>> getAll(){
        return ResponseEntity.ok().body(quadraService.getAll());
    }

    @GetMapping("/{id}")
    public ResponseEntity<QuadraModel> getId(@PathVariable Long id){
        return ResponseEntity.ok().body(quadraService.getId(id));
    }

    @PutMapping("/{id}")
    public ResponseEntity<QuadraModel> update(@PathVariable Long id, @RequestBody QuadraModel quadraModel){
        quadraModel.setId(id);
        return ResponseEntity.ok().body(quadraService.update(id, quadraModel));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> delete(@PathVariable Long id){
        quadraService.delete(id);
        return ResponseEntity.noContent().build();
    }
}
