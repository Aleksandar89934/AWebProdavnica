package model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class purchasedProducts {
    
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int purchasedProductsId;
    
    public int productid;
    public String naziv;
    public double cena;
    public String slika;
    public String opis;
    public String username;

    
    
    public int getPurchasedProductsId() {
        return purchasedProductsId;
    }

    public void setPurchasedProductsId(int purchasedProductsId) {
        this.purchasedProductsId = purchasedProductsId;
    }
    public int getProductid() {
        return productid;
    }

    public void setProductid(int productid) {
        this.productid = productid;
    }

    public String getNaziv() {
        return naziv;
    }

    public void setNaziv(String naziv) {
        this.naziv = naziv;
    }

    public double getCena() {
        return cena;
    }

    public void setCena(double cena) {
        this.cena = cena;
    }

    public String getSlika() {
        return slika;
    }

    public void setSlika(String slika) {
        this.slika = slika;
    }

    public String getOpis() {
        return opis;
    }

    public void setOpis(String opis) {
        this.opis = opis;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
    
}
