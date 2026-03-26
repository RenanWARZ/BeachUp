package BackAnd.BeachUp.UsuarioService;

import BackAnd.BeachUp.UsuarioModel.JogadorModel;
import BackAnd.BeachUp.UsuarioModel.Usuario;
import BackAnd.BeachUp.UsuarioRepository.JogadorRepository;
import BackAnd.BeachUp.UsuarioRepository.UsuarioRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class CustomUserDetailsService implements UserDetailsService {

    @Autowired
    private UsuarioRepository usuarioRepository;

    @Autowired
    private JogadorRepository jogadorRepository;

    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {


        Optional<Usuario> usuario = usuarioRepository.findByEmail(email);
        if (usuario.isPresent()) {
            return usuario.get();
        }


        Optional<JogadorModel> jogador = jogadorRepository.findByEmail(email);
        if (jogador.isPresent()) {
            return jogador.get();
        }

        throw new UsernameNotFoundException("Usuário não encontrado");
    }
}
