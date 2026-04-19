package Backend.BeachUp.Repositorys;

import Backend.BeachUp.Models.QuadraModel;
import org.hibernate.boot.jaxb.mapping.spi.JaxbPersistentAttribute;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface QuadraRepository extends JpaRepository<QuadraModel, Long> {

}
