/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package contacttracing;

import java.awt.Toolkit;
import javax.swing.JOptionPane;

/**
 *
 * @author Alessandro Palumbo
 */
public class MainCT extends javax.swing.JFrame {
    int i = 0;
    /**
     * Creates new form MainCT
     */
    public MainCT(int i) {
        initComponents();
        if (i!=1) 
            loginOrExit();
        setIcon();
    }
    
    private void loginOrExit() {
      Login l = new Login(this, true);
      l.setVisible(true);
      if (l.getPressed() == Login.PRESS_CANCEL) {
         dispose();
      } else {
         setVisible(true);
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

        jMenuBar2 = new javax.swing.JMenuBar();
        jMenu1 = new javax.swing.JMenu();
        jMenu2 = new javax.swing.JMenu();
        Presence = new javax.swing.JButton();
        newHospital = new javax.swing.JButton();
        newPatient = new javax.swing.JButton();
        newTest = new javax.swing.JButton();
        newLoc = new javax.swing.JButton();
        Tracking = new javax.swing.JButton();
        Situation = new javax.swing.JButton();
        jLabel1 = new javax.swing.JLabel();
        jLabel2 = new javax.swing.JLabel();
        jMenuBar1 = new javax.swing.JMenuBar();
        jFile = new javax.swing.JMenu();
        jMenuItem1 = new javax.swing.JMenuItem();
        jMenuItem2 = new javax.swing.JMenuItem();

        jMenu1.setText("File");
        jMenuBar2.add(jMenu1);

        jMenu2.setText("Edit");
        jMenuBar2.add(jMenu2);

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        Presence.setBackground(new java.awt.Color(153, 153, 153));
        Presence.setText("Aggiunta Occorrenze");
        Presence.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                PresenceActionPerformed(evt);
            }
        });

        newHospital.setText("Nuovo Ospedale");
        newHospital.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                newHospitalActionPerformed(evt);
            }
        });

        newPatient.setText("Nuovo Paziente");
        newPatient.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                newPatientActionPerformed(evt);
            }
        });

        newTest.setText("Nuova Visita");
        newTest.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                newTestActionPerformed(evt);
            }
        });

        newLoc.setText("Nuovo Luogo");
        newLoc.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                newLocActionPerformed(evt);
            }
        });

        Tracking.setBackground(new java.awt.Color(0, 102, 153));
        Tracking.setForeground(new java.awt.Color(255, 255, 255));
        Tracking.setText("Tracking");
        Tracking.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                TrackingActionPerformed(evt);
            }
        });

        Situation.setBackground(new java.awt.Color(0, 153, 153));
        Situation.setForeground(new java.awt.Color(255, 255, 255));
        Situation.setText("Bollettino Epidemiologico");
        Situation.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                SituationActionPerformed(evt);
            }
        });

        jLabel1.setFont(new java.awt.Font("Segoe UI Black", 0, 14)); // NOI18N
        jLabel1.setForeground(new java.awt.Color(51, 51, 51));
        jLabel1.setText("MENU' PRINCIPALE");

        jLabel2.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/logo.jpg"))); // NOI18N

        jFile.setText("File");
        jFile.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jFileActionPerformed(evt);
            }
        });

        jMenuItem1.setText("Info");
        jMenuItem1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jMenuItem1ActionPerformed(evt);
            }
        });
        jFile.add(jMenuItem1);

        jMenuItem2.setText("Logoff");
        jMenuItem2.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jMenuItem2ActionPerformed(evt);
            }
        });
        jFile.add(jMenuItem2);

        jMenuBar1.add(jFile);

        setJMenuBar(jMenuBar1);

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(52, 52, 52)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(jLabel1, javax.swing.GroupLayout.PREFERRED_SIZE, 138, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addContainerGap())
                    .addGroup(layout.createSequentialGroup()
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING, false)
                            .addComponent(newLoc, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                            .addComponent(newTest, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                            .addComponent(newPatient, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                            .addComponent(newHospital, javax.swing.GroupLayout.Alignment.LEADING, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                            .addComponent(Presence, javax.swing.GroupLayout.Alignment.LEADING, javax.swing.GroupLayout.PREFERRED_SIZE, 154, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 29, Short.MAX_VALUE)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                                .addComponent(jLabel2)
                                .addGap(37, 37, 37))
                            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                                    .addComponent(Situation, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                                    .addComponent(Tracking, javax.swing.GroupLayout.PREFERRED_SIZE, 167, javax.swing.GroupLayout.PREFERRED_SIZE))
                                .addGap(83, 83, 83))))))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                .addGap(40, 40, 40)
                .addComponent(jLabel1)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addGroup(layout.createSequentialGroup()
                        .addGap(5, 5, 5)
                        .addComponent(jLabel2)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addComponent(Tracking, javax.swing.GroupLayout.PREFERRED_SIZE, 42, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(Situation, javax.swing.GroupLayout.PREFERRED_SIZE, 42, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addGroup(layout.createSequentialGroup()
                        .addGap(39, 39, 39)
                        .addComponent(Presence, javax.swing.GroupLayout.PREFERRED_SIZE, 42, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(newHospital, javax.swing.GroupLayout.PREFERRED_SIZE, 44, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(newPatient, javax.swing.GroupLayout.PREFERRED_SIZE, 41, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(newTest, javax.swing.GroupLayout.PREFERRED_SIZE, 42, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(newLoc, javax.swing.GroupLayout.PREFERRED_SIZE, 42, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addGap(23, 35, Short.MAX_VALUE))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void TrackingActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_TrackingActionPerformed
        ViewTracking vt;
        vt = new ViewTracking();
        vt.setVisible(true);
        dispose();
    }//GEN-LAST:event_TrackingActionPerformed

    private void SituationActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_SituationActionPerformed
       ViewSituation vs;
       vs = new ViewSituation();
       vs.setVisible(true);     
       dispose();
    }//GEN-LAST:event_SituationActionPerformed

    private void PresenceActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_PresenceActionPerformed
       NewPresence npr;
       npr = new NewPresence();
       npr.setVisible(true);     
       dispose();
    }//GEN-LAST:event_PresenceActionPerformed

    private void newHospitalActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_newHospitalActionPerformed
        NewHospital nh;
        nh = new NewHospital();
        nh.setVisible(true);
        dispose();
    }//GEN-LAST:event_newHospitalActionPerformed

    private void newPatientActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_newPatientActionPerformed
        newPatient np;
        np = new newPatient();
        np.setVisible(true);
        dispose();
    }//GEN-LAST:event_newPatientActionPerformed

    private void newTestActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_newTestActionPerformed
       newTest nt;
       nt = new newTest();
       nt.setVisible(true);     
       dispose();
    }//GEN-LAST:event_newTestActionPerformed

    private void newLocActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_newLocActionPerformed
       newLoc nl;
       nl = new newLoc();
       nl.setVisible(true);     
       dispose();
    }//GEN-LAST:event_newLocActionPerformed

    private void jFileActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jFileActionPerformed
        
    }//GEN-LAST:event_jFileActionPerformed

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

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(MainCT.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(MainCT.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(MainCT.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(MainCT.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                int i = 0;
                MainCT p = new MainCT(i);            
            }
        });
    }

    private void setIcon() {
        setIconImage(Toolkit.getDefaultToolkit().getImage(getClass().getResource("iconcov.jpg")));
    }
    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton Presence;
    private javax.swing.JButton Situation;
    private javax.swing.JButton Tracking;
    private javax.swing.JMenu jFile;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JMenu jMenu1;
    private javax.swing.JMenu jMenu2;
    private javax.swing.JMenuBar jMenuBar1;
    private javax.swing.JMenuBar jMenuBar2;
    private javax.swing.JMenuItem jMenuItem1;
    private javax.swing.JMenuItem jMenuItem2;
    private javax.swing.JButton newHospital;
    private javax.swing.JButton newLoc;
    private javax.swing.JButton newPatient;
    private javax.swing.JButton newTest;
    // End of variables declaration//GEN-END:variables
}
