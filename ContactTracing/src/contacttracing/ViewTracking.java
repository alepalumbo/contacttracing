/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package contacttracing;

import java.awt.Toolkit;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author Alessandro Palumbo
 */
public class ViewTracking extends javax.swing.JFrame {
    DefaultTableModel model;
    /**
     * Creates new form ViewTracking
     */
    
    public ViewTracking() {
        initComponents();
        ViewTable();
        setIcon();
    }
    
    private void ViewTable(){
    
       PreparedStatement st;
       Connection conn;
       ResultSet rs;
       String query = "SELECT * FROM Tracking";
       model = (DefaultTableModel) tabTracking.getModel();
       model.setRowCount(0);
        try {
            conn = Database.getDefaultConnection();
              st = conn.prepareStatement(query);
              rs= st.executeQuery();
           
            while(rs.next()){ 
               String ID1 = rs.getString(1);
               String NomeDiffusore = rs.getString(2);
               String CognomeDiffusore =rs.getString(3);
               String ID2 = rs.getString(4);
               String NomeContagiato = rs.getString(5);
               String CognomeContagiato = rs.getString(6);
               String DataContagio = rs.getString(7);
               String Gravitá = rs.getString(8);
               String Relazione = rs.getString(9);
               model.addRow(new Object[]{ID1,NomeDiffusore,CognomeDiffusore,ID2,NomeContagiato,CognomeContagiato,DataContagio,Gravitá,Relazione});
                
            }
            st.close();
        } catch (SQLException ex) {
          Logger.getLogger(ViewTracking.class.getName()).log(Level.SEVERE, null, ex);
        }      
   }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jScrollPane1 = new javax.swing.JScrollPane();
        tabTracking = new javax.swing.JTable();
        jBack = new javax.swing.JButton();
        jUpdate = new javax.swing.JButton();
        jLabel1 = new javax.swing.JLabel();
        comboRel = new javax.swing.JComboBox<>();
        jMenuBar1 = new javax.swing.JMenuBar();
        jMenu1 = new javax.swing.JMenu();
        jMenuItem1 = new javax.swing.JMenuItem();
        jMenuItem2 = new javax.swing.JMenuItem();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        tabTracking.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {
                {null, null, null, null, null, null, null, null, null},
                {null, null, null, null, null, null, null, null, null},
                {null, null, null, null, null, null, null, null, null},
                {null, null, null, null, null, null, null, null, null}
            },
            new String [] {
                "ID1", "Nome Diffusore", "Cognome Diffusore", "ID2", "Nome Contagiato", "Cognome Contagiato", "Data Contagio", "Gravita'", "Relazione"
            }
        ));
        jScrollPane1.setViewportView(tabTracking);

        jBack.setBackground(new java.awt.Color(204, 0, 0));
        jBack.setText("Indietro");
        jBack.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jBackActionPerformed(evt);
            }
        });

        jUpdate.setBackground(new java.awt.Color(0, 102, 153));
        jUpdate.setText("Aggiorna");
        jUpdate.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jUpdateActionPerformed(evt);
            }
        });

        jLabel1.setFont(new java.awt.Font("Segoe UI", 1, 14)); // NOI18N
        jLabel1.setText("Selezionare il tipo di relazione che intercorre tra i due pazienti:");

        comboRel.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "Amico", "Collega", "Partner", "Parente" }));

        jMenu1.setText("File");

        jMenuItem1.setText("Info");
        jMenuItem1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jMenuItem1ActionPerformed(evt);
            }
        });
        jMenu1.add(jMenuItem1);

        jMenuItem2.setText("Logoff");
        jMenuItem2.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jMenuItem2ActionPerformed(evt);
            }
        });
        jMenu1.add(jMenuItem2);

        jMenuBar1.add(jMenu1);

        setJMenuBar(jMenuBar1);

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jScrollPane1, javax.swing.GroupLayout.DEFAULT_SIZE, 872, Short.MAX_VALUE)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                .addGap(20, 20, 20)
                .addComponent(jLabel1, javax.swing.GroupLayout.PREFERRED_SIZE, 433, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(18, 18, 18)
                .addComponent(comboRel, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(41, 41, 41)
                .addComponent(jUpdate)
                .addGap(18, 18, 18)
                .addComponent(jBack, javax.swing.GroupLayout.PREFERRED_SIZE, 79, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 275, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(18, 18, 18)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jUpdate)
                    .addComponent(jLabel1)
                    .addComponent(comboRel, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jBack))
                .addGap(0, 18, Short.MAX_VALUE))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void jBackActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jBackActionPerformed
        MainCT mc = new MainCT(1);
        mc.setVisible(true);
        dispose();
    }//GEN-LAST:event_jBackActionPerformed

    private void jUpdateActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jUpdateActionPerformed
        boolean n = true;       
        int sel1 = Integer.parseInt(tabTracking.getValueAt(tabTracking.getSelectedRow(),0).toString());
        int sel2 = Integer.parseInt(tabTracking.getValueAt(tabTracking.getSelectedRow(),3).toString());;
        String rel = comboRel.getSelectedItem().toString();
        try{
            sel1 = Integer.parseInt(tabTracking.getValueAt(tabTracking.getSelectedRow(),0).toString());
            sel2 = Integer.parseInt(tabTracking.getValueAt(tabTracking.getSelectedRow(),3).toString());
        }
        catch(ArrayIndexOutOfBoundsException exc){
            JOptionPane.showMessageDialog(null, "Errore. Selezionare la riga da aggiornare.");
            n = false;
        }
        
        if(n) {
            PreparedStatement st;
            Connection conn;
            String query = "UPDATE Contact SET r_Type=? WHERE id_PR1=? AND id_PR2=?";
        try {
           conn = Database.getDefaultConnection();
           st = conn.prepareStatement(query);
           st.setString(1,rel);
           st.setInt(2,sel1);
           st.setInt(3,sel2);
           if(st.executeUpdate()>0){ 
            JOptionPane.showMessageDialog(null, "Relazione aggiornata correttamente.");
            ViewTable();
         }
             st.close();
             } 
        catch (SQLException ex) {
           Logger.getLogger(newLoc.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }//GEN-LAST:event_jUpdateActionPerformed

    private void jMenuItem1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jMenuItem1ActionPerformed
        JOptionPane.showMessageDialog(this,
            "Contact Tracer\nApplicativo Java per emulare il Tracking del virus Sars-CoV-2"
            + "\nUniversità di Napoli Federico II"
            + "\n\nSviluppatore: Alessandro Palumbo N86001990 ",
            "Info", JOptionPane.INFORMATION_MESSAGE);
    }//GEN-LAST:event_jMenuItem1ActionPerformed

    private void jMenuItem2ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jMenuItem2ActionPerformed
        dispose();
    }//GEN-LAST:event_jMenuItem2ActionPerformed
    
    private void setIcon() {
        setIconImage(Toolkit.getDefaultToolkit().getImage(getClass().getResource("iconcov.jpg")));
    }
    /**
     * @param args the command line arguments
     */


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JComboBox<String> comboRel;
    private javax.swing.JButton jBack;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JMenu jMenu1;
    private javax.swing.JMenuBar jMenuBar1;
    private javax.swing.JMenuItem jMenuItem1;
    private javax.swing.JMenuItem jMenuItem2;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JButton jUpdate;
    private javax.swing.JTable tabTracking;
    // End of variables declaration//GEN-END:variables
}
