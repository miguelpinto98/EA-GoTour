/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import java.io.Serializable;
import javax.persistence.*;

/**
 *
 * @author Zé
 */
@Entity
@Table(name="tourists")
public class Tourist extends User implements Serializable  {

    
}
