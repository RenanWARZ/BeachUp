package Backend.BeachUp.Repositorys;

import Backend.BeachUp.Models.Empresa;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.Optional;

@Repository
public interface EmpresaRepository extends JpaRepository<Empresa, Long> {
    Optional <Empresa> findByEmail (String email);

    @Transactional
    void deleteByEmail(String email);

}
