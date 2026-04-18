package BackAnd.BeachUp.Repositorys;

import BackAnd.BeachUp.Models.JogadorModel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.transaction.annotation.Transactional;

import java.util.Optional;

public interface JogadorRepository extends JpaRepository<JogadorModel, Long> {
    Optional<JogadorModel> findByEmail (String email);

    @Transactional
    void deleteByEmail(String email);

}
