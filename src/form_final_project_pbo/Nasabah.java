/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package form_final_project_pbo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.swing.JOptionPane;

/**
 *
 * @author ASUS
 */
public class Nasabah{
    private int NoRek;
    private String nama;
    private int saldo;
    private int NoKtp;
    
    public void setRekening(int NoRek){
        this.NoRek=NoRek;
    }
    public int getRekening(){
        return this.NoRek;
    }
    
    public void setNama(String nama){
        this.nama=nama;
    }
    public String getNama(){
        return this.nama;
    }
    
    public void setSaldo(int saldo){
        this.saldo = saldo;
    }
    public int getSaldo(){
        return this.saldo;
    }
    
    public void setNoKtp(int NoKtp){
        this.NoKtp = NoKtp;
    }
    public int getNoKtp(){
        return this.NoKtp;
    }
 }
    class Bisnis extends Nasabah{
        private Boolean status = false;
        public Bisnis(String nama, int noktp, int norek, int saldo){
            this.setNama(nama);
            this.setNoKtp(noktp);
            this.setRekening(norek);
            this.setSaldo(saldo);
        }
        public Bisnis(int NoRek){
        try{
                    Connection c = KoneksiDatabase.getKoneksi();
                    String sql = "SELECT * FROM nasabah ";
                    Statement s = c.createStatement();
                    ResultSet r = s.executeQuery(sql);
                    while(r.next()){
                        if(NoRek == r.getInt("no_rek")){
                            status = true;
                        }
                    }
                }
                catch(SQLException e){
                    System.out.println("Terjadi Error Load "+e.getMessage());
                }
             }
        void buatRekening(){
            try{
            Connection c = KoneksiDatabase.getKoneksi();
            String sql2 = "INSERT INTO nasabah (no_rek, nama_nasabah, jenis_rek, no_ktp, tanggal) " + "VALUES (?, ?, ?, ?, CURRENT_DATE)";
            String sql3 = "INSERT INTO saldo (saldo, no_rek)" + "VALUES (?,?)";
            try (PreparedStatement p = c.prepareStatement(sql2)) {
                            p.setString(2, this.getNama());
                            p.setInt(4, this.getNoKtp());
                            p.setString(3, "Bisnis");
                            p.setInt(1, this.getRekening());
                            p.executeUpdate();
                            
                        }
            try(PreparedStatement q = c.prepareStatement(sql3)) {
                q.setInt(1, this.getSaldo());
                            q.setInt(2, this.getRekening());
                            q.executeUpdate();
            }
            JOptionPane.showMessageDialog(null, "Sukses membuat akun nasabah baru!\nSukses !");
           // JOptionPane.showMessageDialog(null, "Sukses membuat akun nasabah baru!","Success",JOptionPane.INFORMATION_MESSAGE);
        } catch(SQLException e){
                        JOptionPane.showMessageDialog(null,"Terjadi error tambah!" + e,"Close Alert",JOptionPane.WARNING_MESSAGE);
                    }
        }
    }

    class Biasa extends Nasabah{
        public Boolean status=false;
         public Biasa(String nama, int noktp, int norek, int saldo){
            this.setNama(nama);
            this.setNoKtp(noktp);
            this.setRekening(norek);
            this.setSaldo(saldo);
        }
         public Biasa(int NoRek){
            try{
                    Connection c = KoneksiDatabase.getKoneksi();
                    String sql = "SELECT * FROM nasabah ";
                    Statement s = c.createStatement();
                    ResultSet r = s.executeQuery(sql);
                    while(r.next()){
                        if(NoRek == r.getInt("no_rek")){
                            status = true;
                        }
                    }
                }
                catch(SQLException e){
                    System.out.println("Terjadi Error Load "+e.getMessage());
                }
             }
        void buatRekening(){
            try{
            Connection c = KoneksiDatabase.getKoneksi();
            String sql2 = "INSERT INTO nasabah (no_rek, nama_nasabah, jenis_rek, no_ktp, tanggal) " + "VALUES (?, ?, ?, ?, CURRENT_DATE)";
            String sql3 = "INSERT INTO saldo (saldo, no_rek)" + "VALUES (?,?)";
            try (PreparedStatement p = c.prepareStatement(sql2)) {
                            p.setString(2, this.getNama());
                            p.setInt(4, this.getNoKtp());
                            p.setString(3, "Biasa");
                            p.setInt(1, this.getRekening());
                            p.executeUpdate();
                            
                        }
            try(PreparedStatement q = c.prepareStatement(sql3)) {
                q.setInt(1, this.getSaldo());
                            q.setInt(2, this.getRekening());
                            q.executeUpdate();
            }
            JOptionPane.showMessageDialog(null, "Sukses membuat akun nasabah baru!","Success",JOptionPane.INFORMATION_MESSAGE);
        } catch(SQLException e){
                        JOptionPane.showMessageDialog(null,"Terjadi error tambah!" + e,"Close Alert",JOptionPane.WARNING_MESSAGE);
                    }
        }
    }