package Backend.BeachUp.Models;

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
    @JsonIgnoreProperties("arenas")
    private Empresa empresa;

    @OneToMany(mappedBy = "arenas", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<FotoModel> foto;

    @OneToMany(mappedBy = "arenas", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<QuadraModel> quadraModel;
}
