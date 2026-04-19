package Backend.BeachUp.Repositorys;

import Backend.BeachUp.Models.JogadorModel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.Optional;

@Repository
public interface JogadorRepository extends JpaRepository<JogadorModel, Long> {
    Optional<JogadorModel> findByEmail (String email);

    @Transactional
    void deleteByEmail(String email);

}
