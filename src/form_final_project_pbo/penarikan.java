package form_final_project_pbo;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class penarikan {
    int hasil=0;
    int saldo=0;
    public penarikan(){
        try{
                    Connection d = KoneksiDatabase.getKoneksi();
                    String sql = "SELECT saldo FROM saldo";
                    Statement s = d.createStatement();
                    
                    ResultSet r = s.executeQuery(sql);
                    while(r.next()){
                      hasil=r.getInt("SUM(nominal)");
                    }
                }
                catch(SQLException e){
                    System.out.println("Terjadi Error Load "+e.getMessage());
                }
    }
    
    public penarikan(int noRek){
        try{
                    Connection d = KoneksiDatabase.getKoneksi();
                    String sql = "CALL lihat("+noRek+")";
                    String sql2 = "SELECT saldo FROM saldo "
                            + "WHERE no_rek='"+noRek+"'";
                    Statement s = d.createStatement();
                    ResultSet r = s.executeQuery(sql);                    
                    while(r.next()){
                      hasil=r.getInt("SUM(nominal)");
                    }
                    ResultSet rr = s.executeQuery(sql2);
                    while(rr.next()){
                      saldo=rr.getInt("saldo");
                    }
                }
                catch(SQLException e){
                    System.out.println("Terjadi Error Load "+e.getMessage());
                }
    }
    public int getHasil(){
        return hasil;
    }
    public int getSaldo(){
        return saldo;
    }
    public penarikan (int idsetor, int noRek, int jmlSetoran, int nmTeller, int saldoBaru){        
        int jenis = 102;
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
            System.out.println("Terjadi Error penarikan: "+e.getMessage());
        }
    }
    
/*    public static void main(String args[]){
        penarikan penarikanLihat= new penarikan(111999);
        System.out.println("" + penarikanLihat.getSaldo());
    }*/
}
