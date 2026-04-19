package Backend.BeachUp.Models;

import Backend.BeachUp.ENUMS.TipoCobertura;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "quadra")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@EqualsAndHashCode(of = "id")
public class QuadraModel {

    @Id
    @GeneratedValue( strategy = GenerationType.IDENTITY)

    private Long id;
    private String nome;

    @Enumerated(EnumType.STRING)
    private TipoCobertura tipoCobertura;

    @ManyToOne
    @JoinColumn(name = "arena_id")
    @JsonIgnoreProperties("quadra")
    private ArenaModel arenas;
}
