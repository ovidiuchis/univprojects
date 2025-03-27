namespace Lab4
{
    partial class RezervariForm
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.dataGridView = new System.Windows.Forms.DataGridView();
            this.afiseazaButton = new System.Windows.Forms.Button();
            this.commitButton = new System.Windows.Forms.Button();
            this.startButton = new System.Windows.Forms.Button();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.label1 = new System.Windows.Forms.Label();
            this.izolareComboBox = new System.Windows.Forms.ComboBox();
            this.adaugaButton = new System.Windows.Forms.Button();
            this.stergeButton = new System.Windows.Forms.Button();
            this.textBox1 = new System.Windows.Forms.TextBox();
            this.locuriTextBox = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.rezervaButton = new System.Windows.Forms.Button();
            this.exitButton = new System.Windows.Forms.Button();
            this.groupBox2 = new System.Windows.Forms.GroupBox();
            this.rezervatLabel = new System.Windows.Forms.Label();
            this.totalLabel = new System.Windows.Forms.Label();
            this.cursaLabel = new System.Windows.Forms.Label();
            this.label7 = new System.Windows.Forms.Label();
            this.liberLabel = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.button1 = new System.Windows.Forms.Button();
            this.groupBox3 = new System.Windows.Forms.GroupBox();
            this.freeLabel = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView)).BeginInit();
            this.groupBox1.SuspendLayout();
            this.groupBox2.SuspendLayout();
            this.groupBox3.SuspendLayout();
            this.SuspendLayout();
            // 
            // dataGridView
            // 
            this.dataGridView.BackgroundColor = System.Drawing.SystemColors.ControlLight;
            this.dataGridView.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView.Location = new System.Drawing.Point(12, 96);
            this.dataGridView.Name = "dataGridView";
            this.dataGridView.Size = new System.Drawing.Size(362, 193);
            this.dataGridView.TabIndex = 0;
            this.dataGridView.SelectionChanged += new System.EventHandler(this.dataGridView_SelectionChanged);
            // 
            // afiseazaButton
            // 
            this.afiseazaButton.Location = new System.Drawing.Point(12, 295);
            this.afiseazaButton.Name = "afiseazaButton";
            this.afiseazaButton.Size = new System.Drawing.Size(104, 23);
            this.afiseazaButton.TabIndex = 1;
            this.afiseazaButton.Text = "Afiseaza informatii";
            this.afiseazaButton.UseVisualStyleBackColor = true;
            this.afiseazaButton.Click += new System.EventHandler(this.afiseazaButton_Click);
            // 
            // commitButton
            // 
            this.commitButton.Location = new System.Drawing.Point(426, 25);
            this.commitButton.Name = "commitButton";
            this.commitButton.Size = new System.Drawing.Size(91, 23);
            this.commitButton.TabIndex = 2;
            this.commitButton.Text = "Commit";
            this.commitButton.UseVisualStyleBackColor = true;
            this.commitButton.Click += new System.EventHandler(this.commitButton_Click);
            // 
            // startButton
            // 
            this.startButton.Location = new System.Drawing.Point(309, 25);
            this.startButton.Name = "startButton";
            this.startButton.Size = new System.Drawing.Size(100, 23);
            this.startButton.TabIndex = 3;
            this.startButton.Text = "Start";
            this.startButton.UseVisualStyleBackColor = true;
            this.startButton.Click += new System.EventHandler(this.startButton_Click_1);
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.label1);
            this.groupBox1.Controls.Add(this.izolareComboBox);
            this.groupBox1.Controls.Add(this.commitButton);
            this.groupBox1.Controls.Add(this.startButton);
            this.groupBox1.Location = new System.Drawing.Point(12, 13);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(535, 56);
            this.groupBox1.TabIndex = 4;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Tranzactie";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(6, 28);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(67, 13);
            this.label1.TabIndex = 4;
            this.label1.Text = "Nivel izolare:";
            // 
            // izolareComboBox
            // 
            this.izolareComboBox.FormattingEnabled = true;
            this.izolareComboBox.Location = new System.Drawing.Point(79, 25);
            this.izolareComboBox.Name = "izolareComboBox";
            this.izolareComboBox.Size = new System.Drawing.Size(206, 21);
            this.izolareComboBox.TabIndex = 0;
            // 
            // adaugaButton
            // 
            this.adaugaButton.Location = new System.Drawing.Point(132, 295);
            this.adaugaButton.Name = "adaugaButton";
            this.adaugaButton.Size = new System.Drawing.Size(113, 23);
            this.adaugaButton.TabIndex = 6;
            this.adaugaButton.Text = "Adauga cursa";
            this.adaugaButton.UseVisualStyleBackColor = true;
            this.adaugaButton.Click += new System.EventHandler(this.adaugaButton_Click);
            // 
            // stergeButton
            // 
            this.stergeButton.Location = new System.Drawing.Point(260, 295);
            this.stergeButton.Name = "stergeButton";
            this.stergeButton.Size = new System.Drawing.Size(114, 23);
            this.stergeButton.TabIndex = 7;
            this.stergeButton.Text = "Sterge cursa";
            this.stergeButton.UseVisualStyleBackColor = true;
            this.stergeButton.Click += new System.EventHandler(this.stergeButton_Click);
            // 
            // textBox1
            // 
            this.textBox1.Location = new System.Drawing.Point(9, 45);
            this.textBox1.Name = "textBox1";
            this.textBox1.Size = new System.Drawing.Size(118, 20);
            this.textBox1.TabIndex = 8;
            // 
            // locuriTextBox
            // 
            this.locuriTextBox.Location = new System.Drawing.Point(9, 95);
            this.locuriTextBox.Name = "locuriTextBox";
            this.locuriTextBox.Size = new System.Drawing.Size(118, 20);
            this.locuriTextBox.TabIndex = 9;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(6, 29);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(34, 13);
            this.label2.TabIndex = 10;
            this.label2.Text = "Cursa";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(6, 79);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(36, 13);
            this.label3.TabIndex = 11;
            this.label3.Text = "Locuri";
            // 
            // rezervaButton
            // 
            this.rezervaButton.Location = new System.Drawing.Point(9, 145);
            this.rezervaButton.Name = "rezervaButton";
            this.rezervaButton.Size = new System.Drawing.Size(118, 23);
            this.rezervaButton.TabIndex = 12;
            this.rezervaButton.Text = "Rezerva";
            this.rezervaButton.UseVisualStyleBackColor = true;
            this.rezervaButton.Click += new System.EventHandler(this.rezervaButton_Click);
            // 
            // exitButton
            // 
            this.exitButton.Location = new System.Drawing.Point(581, 295);
            this.exitButton.Name = "exitButton";
            this.exitButton.Size = new System.Drawing.Size(118, 23);
            this.exitButton.TabIndex = 13;
            this.exitButton.Text = "Iesi";
            this.exitButton.UseVisualStyleBackColor = true;
            this.exitButton.Click += new System.EventHandler(this.exitButton_Click);
            // 
            // groupBox2
            // 
            this.groupBox2.Controls.Add(this.freeLabel);
            this.groupBox2.Controls.Add(this.rezervatLabel);
            this.groupBox2.Controls.Add(this.totalLabel);
            this.groupBox2.Controls.Add(this.cursaLabel);
            this.groupBox2.Controls.Add(this.label7);
            this.groupBox2.Controls.Add(this.liberLabel);
            this.groupBox2.Controls.Add(this.label5);
            this.groupBox2.Controls.Add(this.label4);
            this.groupBox2.Controls.Add(this.button1);
            this.groupBox2.Location = new System.Drawing.Point(393, 96);
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.Size = new System.Drawing.Size(154, 183);
            this.groupBox2.TabIndex = 14;
            this.groupBox2.TabStop = false;
            this.groupBox2.Text = "Locuri";
            // 
            // rezervatLabel
            // 
            this.rezervatLabel.AutoSize = true;
            this.rezervatLabel.Location = new System.Drawing.Point(73, 102);
            this.rezervatLabel.Name = "rezervatLabel";
            this.rezervatLabel.Size = new System.Drawing.Size(0, 13);
            this.rezervatLabel.TabIndex = 7;
            // 
            // totalLabel
            // 
            this.totalLabel.AutoSize = true;
            this.totalLabel.Location = new System.Drawing.Point(51, 52);
            this.totalLabel.Name = "totalLabel";
            this.totalLabel.Size = new System.Drawing.Size(0, 13);
            this.totalLabel.TabIndex = 6;
            // 
            // cursaLabel
            // 
            this.cursaLabel.AutoSize = true;
            this.cursaLabel.Location = new System.Drawing.Point(51, 29);
            this.cursaLabel.Name = "cursaLabel";
            this.cursaLabel.Size = new System.Drawing.Size(0, 13);
            this.cursaLabel.TabIndex = 5;
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Location = new System.Drawing.Point(7, 102);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(59, 13);
            this.label7.TabIndex = 4;
            this.label7.Text = "Rezervate:";
            // 
            // liberLabel
            // 
            this.liberLabel.AutoSize = true;
            this.liberLabel.Location = new System.Drawing.Point(7, 79);
            this.liberLabel.Name = "liberLabel";
            this.liberLabel.Size = new System.Drawing.Size(39, 13);
            this.liberLabel.TabIndex = 3;
            this.liberLabel.Text = "Libere:";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(7, 52);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(34, 13);
            this.label5.TabIndex = 2;
            this.label5.Text = "Total:";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(7, 29);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(37, 13);
            this.label4.TabIndex = 1;
            this.label4.Text = "Cursa:";
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(18, 145);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(118, 23);
            this.button1.TabIndex = 0;
            this.button1.Text = "Afiseaza";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // groupBox3
            // 
            this.groupBox3.Controls.Add(this.label2);
            this.groupBox3.Controls.Add(this.textBox1);
            this.groupBox3.Controls.Add(this.locuriTextBox);
            this.groupBox3.Controls.Add(this.rezervaButton);
            this.groupBox3.Controls.Add(this.label3);
            this.groupBox3.Location = new System.Drawing.Point(572, 96);
            this.groupBox3.Name = "groupBox3";
            this.groupBox3.Size = new System.Drawing.Size(139, 183);
            this.groupBox3.TabIndex = 15;
            this.groupBox3.TabStop = false;
            this.groupBox3.Text = "Rezerva loc";
            // 
            // freeLabel
            // 
            this.freeLabel.AutoSize = true;
            this.freeLabel.Location = new System.Drawing.Point(53, 78);
            this.freeLabel.Name = "freeLabel";
            this.freeLabel.Size = new System.Drawing.Size(0, 13);
            this.freeLabel.TabIndex = 8;
            // 
            // RezervariForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.LightSteelBlue;
            this.ClientSize = new System.Drawing.Size(731, 340);
            this.Controls.Add(this.groupBox3);
            this.Controls.Add(this.groupBox2);
            this.Controls.Add(this.exitButton);
            this.Controls.Add(this.stergeButton);
            this.Controls.Add(this.adaugaButton);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.afiseazaButton);
            this.Controls.Add(this.dataGridView);
            this.Name = "RezervariForm";
            this.Text = "Form1";
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView)).EndInit();
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.groupBox2.ResumeLayout(false);
            this.groupBox2.PerformLayout();
            this.groupBox3.ResumeLayout(false);
            this.groupBox3.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.DataGridView dataGridView;
        private System.Windows.Forms.Button afiseazaButton;
        private System.Windows.Forms.Button commitButton;
        private System.Windows.Forms.Button startButton;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.ComboBox izolareComboBox;
        private System.Windows.Forms.Button adaugaButton;
        private System.Windows.Forms.Button stergeButton;
        private System.Windows.Forms.TextBox textBox1;
        private System.Windows.Forms.TextBox locuriTextBox;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Button rezervaButton;
        private System.Windows.Forms.Button exitButton;
        private System.Windows.Forms.GroupBox groupBox2;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.GroupBox groupBox3;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.Label liberLabel;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label totalLabel;
        private System.Windows.Forms.Label cursaLabel;
        private System.Windows.Forms.Label rezervatLabel;
        private System.Windows.Forms.Label freeLabel;
    }
}

