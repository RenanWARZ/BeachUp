package BackAnd.BeachUp.Models;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import jakarta.persistence.*;
import lombok.*;

import java.util.List;

@Entity
@Table (name = "arenas")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@EqualsAndHashCode(of = "id")
public class ArenaModel {

    @Id
    @GeneratedValue (strategy = GenerationType.IDENTITY)

    private Long id;

    @Column (length = 50)
    private String nome;

    @Column (length = 100)
    private String descricao;

    @ManyToOne
    @JoinColumn(name = "empresa_id")
    @JsonIgnoreProperties("arena")
    private Empresa empresa;

    @OneToMany(mappedBy = "arena", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<FotoModel> fotoModel;
}
