package Backend.BeachUp.Repositorys;

import Backend.BeachUp.Models.ArenaModel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ArenaRepository extends JpaRepository<ArenaModel, Long> {
}
