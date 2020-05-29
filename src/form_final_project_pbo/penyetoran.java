package form_final_project_pbo;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class penyetoran {
    public penyetoran (int idsetor, int noRek, int jmlSetoran, int nmTeller, int saldoBaru){        
        int jenis = 101;
        Date tanggal = new java.sql.Date(System.currentTimeMillis());
        try{
            Connection c = KoneksiDatabase.getKoneksi();
            String sql2 = "INSERT INTO saldo VALUES (?, ?)";
            String sql = "INSERT INTO transaksi VALUES (?, ?, ?, ?, ?, ?)";

            
            try (PreparedStatement p = c.prepareStatement(sql2)) {
                p.setInt(2, noRek);
                p.setInt(1, saldoBaru);
                p.executeUpdate();
            }
            try (PreparedStatement p = c.prepareStatement(sql)) {
                p.setInt(1, idsetor+1);
                p.setInt(3, noRek);
                p.setInt(4, jmlSetoran);
                p.setInt(2, nmTeller);
                p.setDate(5,tanggal);
                p.setInt(6, jenis);
                p.executeUpdate();
            }
        }
        catch(SQLException e){
            System.out.println("Terjadi Error penyetoran: "+e.getMessage());
        }
    }
}
