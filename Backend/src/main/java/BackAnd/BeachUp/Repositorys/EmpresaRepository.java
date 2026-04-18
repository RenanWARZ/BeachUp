package BackAnd.BeachUp.Repositorys;

import BackAnd.BeachUp.Models.Empresa;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.transaction.annotation.Transactional;

import java.util.Optional;

public interface EmpresaRepository extends JpaRepository<Empresa, Long> {
    Optional <Empresa> findByEmail (String email);

    @Transactional
    void deleteByEmail(String email);

}
